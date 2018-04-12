#include "./mips/processor.h"

int main(int argc, char const *argv[]) {
    const char *textfile = argv[1];
    const char *datafile = argv[2];
    uint32_t *text = load_from_file(textfile);
    uint32_t *data = load_from_file(datafile);
    processor_t *processor = new_processor(text, data);

    processor->debug = true;
    while (!processor->off)
    {
        fetch(processor);
        decode(processor);
        execute(processor);
    }

    free_processor(processor);
    return 0;
}
